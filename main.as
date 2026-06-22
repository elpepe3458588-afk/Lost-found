using namespace CB;
using namespace B3D;

void Hook_SelectItem(CB::Item@ item)
{
    if (item is null)
        return;

    if (item.Template.Name != "scp055dej")
        return;

    item.Remove();

    Player::Message = "This meat is so delicious.";
    Player::MessageTimer = 240;

    Player::DeathTimer = 140;
    Player::DeathMessage = "Subject D-9341 was found dead with his body completely charred after a powerful explosion, next to a bitten instance of SCP-055-DE-J, it is presumed that he consumed SCP-055-DE-J.";
}