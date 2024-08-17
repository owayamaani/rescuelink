import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Array "mo:base/Array"; // Import Array module

// Define the canister as an actor
actor ReliefChain {

    // Stable variables to hold donations, volunteers, and resources
    stable var donations: [(Text, Nat)] = []; // List of donations (name, amount)
    stable var volunteers: [Text] = [];        // List of volunteer names
    stable var resources: [(Text, Text)] = []; // List of resources (resource type, details)

    // Method to donate
    public func donate(name: Text, amount: Nat) : async Text {
        donations := Array.append(donations, [(name, amount)]);
        Debug.print("Donation received: " # name # " donated " # Nat.toText(amount) # " ICP");
        return "Thank you for your donation!";
    };

    // Method to register as a volunteer
    public func registerVolunteer(name: Text) : async Text {
        volunteers := Array.append(volunteers, [name]);
        Debug.print("Volunteer registered: " # name);
        return "Thank you for registering as a volunteer!";
    };

    // Method to add a resource
    public func addResource(resourceType: Text, details: Text) : async Text {
        resources := Array.append(resources, [(resourceType, details)]);
        Debug.print("Resource added: " # resourceType # " - " # details);
        return "Resource added successfully!";
    };

    // Method to get donations
    public query func getDonations() : async [(Text, Nat)] {
        return donations;
    };

    // Method to get volunteers
    public query func getVolunteers() : async [Text] {
        return volunteers;
    };

    // Method to get resources
    public query func getResources() : async [(Text, Text)] {
        return resources;
    };
};
