namespace Application.Interfaces;

public interface IUserAccessor
{
    string GetUsername();
    string GetEmail();
    Guid GetId();
}