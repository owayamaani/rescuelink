// import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Array "mo:base/Array"; // Import Array module

// // Define the canister as an actor
// actor ReliefChain {

//     // Stable variables to hold donations, volunteers, and resources
//     stable var donations: [(Text, Nat)] = []; // List of donations (name, amount)
//     stable var volunteers: [Text] = [];        // List of volunteer names
//     stable var resources: [(Text, Text)] = []; // List of resources (resource type, details)

//     // Method to donate
//     public func donate(name: Text, amount: Nat) : async Text {
//         donations := Array.append(donations, [(name, amount)]);
//         Debug.print("Donation received: " # name # " donated " # Nat.toText(amount) # " ICP");
//         return "Thank you for your donation!";
//     };

//     // Method to register as a volunteer
//     public func registerVolunteer(name: Text) : async Text {
//         volunteers := Array.append(volunteers, [name]);
//         Debug.print("Volunteer registered: " # name);
//         return "Thank you for registering as a volunteer!";
//     };

//     // Method to add a resource
//     public func addResource(resourceType: Text, details: Text) : async Text {
//         resources := Array.append(resources, [(resourceType, details)]);
//         Debug.print("Resource added: " # resourceType # " - " # details);
//         return "Resource added successfully!";
//     };

//     // Method to get donations
//     public query func getDonations() : async [(Text, Nat)] {
//         return donations;
//     };

//     // Method to get volunteers
//     public query func getVolunteers() : async [Text] {
//         return volunteers;
//     };

//     // Method to get resources
//     public query func getResources() : async [(Text, Text)] {
//         return resources;
//     };
// };

actor {
    //Data structure for the resources
    type Resource = {
        id:Nat;
        content : Text;
    };
    
    //Define a record to simulate a key-value store
    var resources : [Resource] = [];
    var nextId: Nat = 0; //Generating unique IDS for each resources


    //Function to enter/store a resource
    public func enterResource(resourceContent: Text) : async Text{
        let resourceId = nextId;
        nextId += 1;
        let resource :  Resource = {
            id = resourceId;
            content = resourceContent;
        };
        resources := Array.append(resources, [resource]);
        return "Hello, you have submitted: " # resourceContent # "!";
    };

    //Function to get resource by ID
    public query func getResource(id:Nat): async ?Resource {
        let result = Array.find(resources, func (r: Resource) : Bool {r.id == id});
        switch(result){
            case (?resource) return ?resource;
            case null {return null;}
        }
    };

    //function to get all  resources
    public query func getAllResources(): async [Resource]{
        return resources;
    };

    //data structure for volunteers
    type Volunteer = {
        id:Nat;
        content: Text;
    };

    //define a record to simulate a key-value store
    //generating new ids for each volunteers
    var volunteers : [Volunteer] = [];
    var nextVolId : Nat = 0;

    //function to enter a new volunteer
    public func enterVolunteer(volunteerContent : Text) : async Text {
        let volunteerId = nextVolId;
        nextVolId += 1;
        let volunteer : Volunteer = {
            id = volunteerId;
            content = volunteerContent;
        };
        volunteers := Array.append(volunteers, [volunteer]);
        return "Thank you "# volunteerContent # ", for registering as a volunteer";
    };

    //function to get volunteer by Id
    public query func getVolunteer(id:Nat): async ?Volunteer {
        let result = Array.find(volunteers, func (v: Volunteer) : Bool {v.id == id});
        switch(result) {
            case(?volunteer) return ?volunteer;
            case null {return null;}
        };
    };
    
    //function to get all volunteers
    public query func getAllVolunteers(): async [Volunteer]{
        return volunteers;
    };

}
