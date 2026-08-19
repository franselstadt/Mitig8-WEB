using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mitig8.Domain.Collections;
using Mitig8.Domain.Collections.Interfaces;
using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items;
using Mitig8.Domain.Items.View;
using Mitig8.Extensions;

namespace Mitig8.Infrastructure.Persistence
{
    public class CollectionPersistence : ICollectionPersistence
    {
        public void CreateItems(object collection)
        {
            throw new InvalidOperationException("Bulk create is not mapped for " + collection.GetType().Name + ". Use item.Create() or collection.CreateItems() default iteration.");
        }

        public Task CreateItemsAsync(object collection)
        {
            return Task.Run(() => this.CreateItems(collection));
        }

        public void ReadItems(object collection)
        {
            AssessmentWorklistViewCollection worklist = collection as AssessmentWorklistViewCollection;
            if (worklist != null)
            {
                this.ReadAssessmentWorklist(worklist);
                return;
            }

            CompanyListViewCollection companies = collection as CompanyListViewCollection;
            if (companies != null)
            {
                this.ReadCompanyList(companies);
                return;
            }

            UserCollection users = collection as UserCollection;
            if (users != null)
            {
                this.ReadUsers(users);
                return;
            }

            AssessmentStatsViewCollection stats = collection as AssessmentStatsViewCollection;
            if (stats != null)
            {
                this.ReadAssessmentStats(stats);
                return;
            }

            HomeSummaryViewCollection home = collection as HomeSummaryViewCollection;
            if (home != null)
            {
                this.ReadHomeSummary(home);
                return;
            }

            BillingStatsViewCollection billing = collection as BillingStatsViewCollection;
            if (billing != null)
            {
                this.ReadBillingStats(billing);
                return;
            }

            throw new InvalidOperationException("ReadItems is not mapped for " + collection.GetType().Name + ".");
        }

        public Task ReadItemsAsync(object collection)
        {
            return Task.Run(() => this.ReadItems(collection));
        }

        public void UpdateItems(object collection)
        {
            throw new InvalidOperationException("Bulk update is not mapped for " + collection.GetType().Name + ".");
        }

        public Task UpdateItemsAsync(object collection)
        {
            return Task.Run(() => this.UpdateItems(collection));
        }

        public void DeleteItems(object collection)
        {
            throw new InvalidOperationException("Bulk delete is not mapped for " + collection.GetType().Name + ".");
        }

        public Task DeleteItemsAsync(object collection)
        {
            return Task.Run(() => this.DeleteItems(collection));
        }

        private void ReadAssessmentWorklist(AssessmentWorklistViewCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<AssessmentWorklistViewItem>();

                if (collection.Archived)
                {
                    List<getAssessmentsAllArchive_Result2> rows = db.getAssessmentsAllArchive(collection.UserID).ToList();
                    foreach (getAssessmentsAllArchive_Result2 row in rows)
                    {
                        collection.Items.Add(this.MapArchive(row));
                    }
                }
                else
                {
                    List<getAssessmentsAllActive_Result3> rows = db.getAssessmentsAllActive(collection.UserID).ToList();
                    foreach (getAssessmentsAllActive_Result3 row in rows)
                    {
                        collection.Items.Add(this.MapActive(row));
                    }
                }
            }
        }

        private void ReadCompanyList(CompanyListViewCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<CompanyListViewItem>();
                List<getCompanies_Result> rows = db.getCompanies().ToList();
                foreach (getCompanies_Result row in rows)
                {
                    CompanyListViewItem item = new CompanyListViewItem();
                    item.CompanyID = row.ID;
                    item.Name = row.Name.OrEmpty();
                    item.Type = row.Type.OrEmpty();
                    item.Tell = row.Tell.OrEmpty();
                    item.Email = row.Email.OrEmpty();
                    item.Registration = row.Registration.OrEmpty();
                    collection.Items.Add(item);
                }
            }
        }

        private void ReadUsers(UserCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<UserItem>();
                List<getCompanyUsers_Result> rows = db.getCompanyUsers(collection.CompanyID).ToList();
                foreach (getCompanyUsers_Result row in rows)
                {
                    UserItem item = new UserItem();
                    item.ID = row.UserID;
                    item.FirstName = row.Firstname;
                    item.LastName = row.LastName;
                    item.IdentityNumber = row.IdentityNumber;
                    item.Active = row.Active;
                    item.Cellphone = row.Cellphone;
                    item.Email = row.Email;
                    item.FirebaseMessengerID = row.FirebaseMessengerID;
                    item.CompanyID = collection.CompanyID;
                    collection.Items.Add(item);
                }
            }
        }

        private void ReadAssessmentStats(AssessmentStatsViewCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<AssessmentStatsViewItem>();
                getAssessmentsAllStats_Result2 row = db.getAssessmentsAllStats(collection.UserID).FirstOrDefault();
                AssessmentStatsViewItem item = new AssessmentStatsViewItem();
                if (row != null)
                {
                    item.Created = row.Created;
                    item.Quoting = row.Quoting;
                    item.InProgress = row.In_Progress;
                    item.Complete = row.Complete;
                    item.Failed = row.Failed;
                    item.Cancelled = row.Cancelled;
                    item.QA = row.QA;
                }

                collection.Items.Add(item);
            }
        }

        private void ReadHomeSummary(HomeSummaryViewCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<HomeSummaryViewItem>();
                HomeSummaryViewItem item = new HomeSummaryViewItem();

                getUserDetailsHome_Result userHome = db.getUserDetailsHome(collection.UserID, collection.CompanyID).FirstOrDefault();
                if (userHome != null)
                {
                    item.Notifications = userHome.Notifications;
                    item.Assessments = userHome.Assessments.OrZero();
                    item.Users = userHome.Users.OrZero();
                    item.Invoices = userHome.Invoices;
                }

                getDetailsHomeGlobal_Result globalHome = db.getDetailsHomeGlobal().FirstOrDefault();
                if (globalHome != null)
                {
                    item.TotalAssessments = globalHome.Assessments.OrZero();
                    item.Insurers = globalHome.Insurers.OrZero();
                    item.Assessors = globalHome.Assessors.OrZero();
                    item.Specialists = globalHome.Specialist.OrZero();
                }

                collection.Items.Add(item);
            }
        }

        private void ReadBillingStats(BillingStatsViewCollection collection)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                collection.Items = new List<BillingStatsViewItem>();
                getBillingStats_Result row = db.getBillingStats(collection.UserID).FirstOrDefault();
                BillingStatsViewItem item = new BillingStatsViewItem();
                if (row != null)
                {
                    item.AvailableBalance = row.Available_Balance;
                    item.RenewalFee = row.Renewal_Fee;
                    item.UnpaidInvoices = row.Unpaid_Invoices;
                }

                collection.Items.Add(item);
            }
        }

        private AssessmentWorklistViewItem MapActive(getAssessmentsAllActive_Result3 row)
        {
            AssessmentWorklistViewItem item = new AssessmentWorklistViewItem();
            item.AssessmentID = row.Assessment;
            item.InsurerName = row.Insurer_Name.OrEmpty();
            item.PolicyNumber = row.Policy_Number.OrEmpty();
            item.AssessmentDate = row.Assessment_Date.OrEmpty();
            item.BookingDate = row.Booking_Date.OrEmpty();
            item.InsuredName = row.Insured_Name.OrEmpty();
            item.InsuredAddress = row.Insured_Address.OrEmpty();
            item.InsuredContactNumber = row.Insured_Contact_Number.OrEmpty();
            item.InsuredIndustrySector = row.Insured_Industry_Sector.OrEmpty();
            item.Status = row.Status.OrEmpty();
            item.IsPolicyCaptureInProgress = item.Status == "<i class=\"fas fa-spinner fa-spin\"></i> Policy Capture In Progress";
            return item;
        }

        private AssessmentWorklistViewItem MapArchive(getAssessmentsAllArchive_Result2 row)
        {
            AssessmentWorklistViewItem item = new AssessmentWorklistViewItem();
            item.AssessmentID = row.Assessment;
            item.InsurerName = row.Insurer_Name.OrEmpty();
            item.PolicyNumber = row.Policy_Number.OrEmpty();
            item.AssessmentDate = row.Assessment_Date.OrEmpty();
            item.BookingDate = row.Booking_Date.OrEmpty();
            item.InsuredName = row.Insured_Name.OrEmpty();
            item.InsuredAddress = row.Insured_Address.OrEmpty();
            item.InsuredContactNumber = row.Insured_Contact_Number.OrEmpty();
            item.InsuredIndustrySector = row.Insured_Industry_Sector.OrEmpty();
            item.Status = row.Status.OrEmpty();
            item.IsPolicyCaptureInProgress = item.Status == "<i class=\"fas fa-spinner fa-spin\"></i> Policy Capture In Progress";
            return item;
        }
    }
}
