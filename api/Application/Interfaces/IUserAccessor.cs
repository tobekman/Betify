namespace Application.Interfaces;

public interface IUserAccessor
{
    string GetUsername();
    Guid GetId();
}