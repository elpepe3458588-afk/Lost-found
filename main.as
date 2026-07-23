using namespace CB;
using namespace B3D;

Pivot pivot096;

bool Hook_InitializeEvents() {
    Event::Create("room096", "room096", 0, 1);

    return false;
}

bool Hook_UpdateEvent(Event e, Room r) {
    if (e.Name == "room2servers") {
        if (NPC::Current096 != null) {
            return true;
        }
    }

    if (e.Name == "room096") {
        if (Player::CurrentRoom.Template.Name == "room096") {
            if (NPC::Current096 == null) {
                e.State = 0;
                if (e.State == 0) {
                    NPC::Current096 = NPC::Create(NPC::Type::SCP096, pivot096.GetX(), pivot096.GetY(), pivot096.GetZ());
                    e.State = 1;
                }
            }
        }
    }
    return false;
}

bool Hook_FillRoom(Room r) {
    // i have no idea what im doing wrong gg
    if (r.Template.Name == "room096") {
        pivot096 = Pivot::Create(Player::CurrentRoom.Object);                     
        pivot096.Position(Player::CurrentRoom.X + 256 / 256.0, 128 / 256.0, Player::CurrentRoom.Z + -1408 / 256.0);
        pivot096.SetParent(Player::CurrentRoom.Object);
    }

    return false;
}

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

void Hook_Update() {
    //copying from treachery!!!
    //C, enables noclip and godmode, and revives, disables hud.
    if (KeyHit(46)) {
        Player::NoClip = true;
        Player::GodMode = true;
        Player::DropSpeed = -0.1f;
        Player::HeadDropSpeed = 0.0f;
        Player::CameraShakeTimer = 0.0f;
        Player::CurrentSpeed = 0.0f;

        Player::HeartBeatVolume = 0.0f;

        Player::FallTimer = 0.0f;
        Player::Collider.Show();

        Player::KillTimer = 0.0f;
        Player::KillAnimation = 0.0f;

        Options::HUDEnabled = false;
    }

    //V, disables noclip and godmode, enables hud.
    if (KeyHit(47)) {
        Player::NoClip = false;
        Player::GodMode = false;
        Options::HUDEnabled = true;
        Player::NoClipSpeed = 2.0f;
    }

    int mouseZSpeed = get_MouseZSpeed();

    //scroll wheel to change noclip speed
    if (mouseZSpeed > 0) {
        Player::NoClipSpeed += 0.1f;
    } else if (mouseZSpeed < 0) {
        Player::NoClipSpeed -= 0.1f;
        if (Player::NoClipSpeed <= 0) {
            Player::NoClipSpeed = 0.1f;
        }
    }
}
//UNFINISHED 689 PROTOYPE
using namespace CB;
using namespace B3D;
Mesh scp689; 
void Hook_Initialize() {
    scp689 = CB::LoadMesh("GFX/npcs/statue.b3d", null);

}
void Hook_Update() {
    scp689.Position(Player::Collider.GetX(), Player::Collider.GetY() + 1.5, Player::Collider.GetZ());
    
} 
//we are scripters of the cb the most moral modders
void Hook_Initialize() {
  scp689 = ...
  scp689.Scale(0.5, 0.5, 0.5);
}

//Now heres the AI
Player::Camera.InView()