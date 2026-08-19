using System;
using System.Linq;
using System.Threading.Tasks;
using Mitig8.Domain.Items;
using Mitig8.Domain.Items.Base;
using Mitig8.Domain.Items.Interfaces;

namespace Mitig8.Infrastructure.Persistence
{
    public class ItemPersistence : IItemPersistence
    {
        public void Create(BaseItem item)
        {
            AssessmentItem assessment = item as AssessmentItem;
            if (assessment != null)
            {
                this.CreateAssessment(assessment);
                return;
            }

            SessionItem session = item as SessionItem;
            if (session != null)
            {
                this.CreateSession(session);
                return;
            }

            throw new InvalidOperationException("Create is not mapped for " + item.GetType().Name + ".");
        }

        public Task CreateAsync(BaseItem item)
        {
            return Task.Run(() => this.Create(item));
        }

        public void Read(BaseItem item)
        {
            AssessmentItem assessment = item as AssessmentItem;
            if (assessment != null)
            {
                this.ReadAssessment(assessment);
                return;
            }

            UserItem user = item as UserItem;
            if (user != null)
            {
                this.ReadUser(user);
                return;
            }

            SessionItem session = item as SessionItem;
            if (session != null)
            {
                this.ReadSession(session);
                return;
            }

            throw new InvalidOperationException("Read is not mapped for " + item.GetType().Name + ".");
        }

        public Task ReadAsync(BaseItem item)
        {
            return Task.Run(() => this.Read(item));
        }

        public void Update(BaseItem item)
        {
            AssessmentItem assessment = item as AssessmentItem;
            if (assessment != null)
            {
                this.UpdateAssessment(assessment);
                return;
            }

            UserItem user = item as UserItem;
            if (user != null)
            {
                this.UpdateUser(user);
                return;
            }

            throw new InvalidOperationException("Update is not mapped for " + item.GetType().Name + ".");
        }

        public Task UpdateAsync(BaseItem item)
        {
            return Task.Run(() => this.Update(item));
        }

        public void Delete(BaseItem item)
        {
            AssessmentItem assessment = item as AssessmentItem;
            if (assessment != null)
            {
                this.DeleteAssessment(assessment);
                return;
            }

            throw new InvalidOperationException("Delete is not mapped for " + item.GetType().Name + ".");
        }

        public Task DeleteAsync(BaseItem item)
        {
            return Task.Run(() => this.Delete(item));
        }

        private void CreateAssessment(AssessmentItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                addAssessment_Result result = db.addAssessment(
                    item.InsurerName,
                    item.InsurerContactPerson,
                    item.InsurerContactNumber,
                    item.InsurancePolicyNumber,
                    item.BrokerName,
                    item.BrokerContactNumber,
                    item.InsuredName,
                    item.InsuredContactNumber,
                    item.InsuredIndustrySector,
                    item.UserID,
                    item.CreatedDate ?? DateTime.UtcNow,
                    item.AssessmentTypeID,
                    item.InsuredEmailAddress,
                    item.InsurerEmailAddress,
                    item.BrokerEmailAddress,
                    item.NewPolicy,
                    item.IndustrySectorID,
                    item.IndustrySubSectorID,
                    item.IndustrySectorClassID,
                    item.IsInternal).FirstOrDefault();

                if (result != null && result.AssessmentID.HasValue)
                {
                    item.ID = result.AssessmentID.Value;
                }
            }
        }

        private void ReadAssessment(AssessmentItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                getAssessmentGeneralInformation_Result8 row = db.getAssessmentGeneralInformation(item.ID).FirstOrDefault();
                if (row == null)
                {
                    throw new InvalidOperationException("Assessment " + item.ID.ToString() + " was not found.");
                }

                item.ID = row.AssessmentID;
                item.AssessmentStatusID = row.AssessmentStatusID;
                item.AssessmentStatusDescription = row.AssessmentStatusDescription;
                item.InsurerName = row.InsurerName;
                item.InsurerContactPerson = row.InsurerContactPerson;
                item.InsurerContactNumber = row.InsurerContactNumber;
                item.InsurerPolicyNumber = row.InsurerPolicyNumber;
                item.InsurancePolicyNumber = row.InsurerPolicyNumber;
                item.BrokerName = row.BrokerName;
                item.BrokerContactNumber = row.BrokerContactNumber;
                item.InsuredName = row.InsuredName;
                item.InsuredContactNumber = row.InsuredContactNumber;
                item.InsuredIndustrySector = row.InsuredIndustrySector;
                item.InsuredEmailAddress = row.InsuredEmailAddress;
                item.InsurerEmailAddress = row.InsurerEmailAddress;
                item.BrokerEmailAddress = row.BrokerEmailAddress;
                item.NewPolicy = row.NewPolicy;
                item.IndustrySectorID = row.IndustrySectorID;
                item.IndustrySubSectorID = row.IndustrySubSectorID;
                item.IndustrySectorClassID = row.IndustryClassID;
                item.EML = row.EML;
                item.MPL = row.MPL;
                item.EMLComments = row.EMLComment;
                item.MPLComments = row.MPLComment;
                item.RiskComments = row.RiskComments;
                item.IsInternal = row.IsInternal;
            }
        }

        private void UpdateAssessment(AssessmentItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                db.updAssessmentGeneralInformation(
                    item.ID,
                    item.InsurerName,
                    item.InsurerContactPerson,
                    item.InsurerContactNumber,
                    item.InsurancePolicyNumber,
                    item.BrokerName,
                    item.BrokerContactNumber,
                    item.InsuredName,
                    item.InsuredContactNumber,
                    item.InsuredIndustrySector,
                    item.UserID,
                    item.UpdatedDate ?? DateTime.UtcNow,
                    item.InsuredEmailAddress,
                    item.InsurerEmailAddress,
                    item.BrokerEmailAddress,
                    item.IndustrySectorID,
                    item.IndustrySubSectorID,
                    item.IndustrySectorClassID,
                    item.IsInternal);
            }
        }

        private void DeleteAssessment(AssessmentItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                db.cancelAssessment(item.ID, item.UserID);
            }
        }

        private void CreateSession(SessionItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                int pin = 0;
                int.TryParse(item.Pin, out pin);

                getSessionToken_Result result = db.getSessionToken(
                    item.Email,
                    item.Password,
                    pin,
                    item.ApplicationID,
                    item.IPAddress).FirstOrDefault();

                if (result == null)
                {
                    throw new InvalidOperationException("Session token could not be issued.");
                }

                item.Token = result.Token;
                item.TokenTitle = result.Title;
                item.TokenMessage = result.Message;
                item.TokenStatus = result.Status;
            }
        }

        private void ReadSession(SessionItem item)
        {
            if (string.IsNullOrWhiteSpace(item.Token))
            {
                throw new InvalidOperationException("SessionItem.Read requires Token.");
            }

            using (DataModal db = DataModalGateway.Create())
            {
                getSessionDetailsToken_Result1 row = db.getSessionDetailsToken(item.Token).FirstOrDefault();
                if (row == null)
                {
                    item.UserID = null;
                    item.Active = 0;
                    return;
                }

                item.ID = row.SessionID;
                item.UserID = row.UserID;
                item.IPAddress = row.IPAddress;
                item.SessionDate = row.SessionDate;
                item.ApplicationID = row.ApplicationID;
                item.Email = row.UserEmail;
                item.Pin = row.UserPin;
                item.Active = 1;
            }
        }

        private void ReadUser(UserItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                getUserDetailsByID_Result1 row = db.getUserDetailsByID(item.ID).FirstOrDefault();
                if (row == null)
                {
                    throw new InvalidOperationException("User " + item.ID.ToString() + " was not found.");
                }

                item.FirstName = row.FirstName;
                item.LastName = row.LastName;
                item.Email = row.Email;
                item.Cellphone = row.Cellphone;
                item.IdentityNumber = row.IdentityNumber;
                item.UserTypeID = row.UserTypeID;
                item.Picture = row.Picture;
                item.Wallpaper = row.Wallpaper;
                item.DateOfBirth = row.DateOfBirth;
                item.Active = row.Active;
                item.IdentityTypeID = row.IdentityTypeID;
                item.CompanyID = row.CompanyID;
            }
        }

        private void UpdateUser(UserItem item)
        {
            using (DataModal db = DataModalGateway.Create())
            {
                db.updUserProfileDetails(
                    item.ID,
                    item.Picture,
                    item.FirstName,
                    item.LastName,
                    item.Cellphone,
                    item.Email);
            }
        }
    }
}
