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
    //Data structure for the resources(record)
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
        return "Thank you for submitting  "  # resourceContent #  " as a resource";
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

    //data structure for volunteers(record)
    type Volunteer = {
        id:Nat;
        content: Text;
    };

    //define a record to simulate a key-value store
    //generating new ids for each volunteers 
    //create an array that will store records
    //Variable to track the next available Id
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
    //searches Volunteer array to get volunteer with matching Id
    public query func getVolunteer(id:Nat): async ?Volunteer {
        let result = Array.find(volunteers, func (v: Volunteer) : Bool {v.id == id});
        //conditional for if volunteer is found and if not
        switch(result) {
            case(?volunteer) return ?volunteer;
            case null {return null;}
        };
    };
    
    //function to get all volunteers-returns the entire array
    public query func getAllVolunteers(): async [Volunteer]{
        return volunteers;
    };

    //defining record for Donations
    type Donation = {
        donorName : Text;
        amount: Nat;
    };
    
    //variable to store donations array
    var donations: [Donation] = [];

    //functions to add a donation

    public func addDonation(donorName: Text, amount: Nat): async Text {
        let donation : Donation = {
            donorName = donorName;
            amount = amount;
        };
        //Appending the new donation to the donations Array
        donations := Array.append(donations, [donation]);
        return "Thank you,"# donorName # ",for donating "# Nat.toText(amount) # " to ICP"

    };

    //functions to get all donations
    public query func getAllDonations(): async [Donation] {
        return donations;
    };

}
