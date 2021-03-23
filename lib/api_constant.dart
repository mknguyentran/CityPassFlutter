
const BASE_URL = "https://citypasswebapi.azurewebsites.net/api/";

// TicketType
// ** GET ** //
const listTicketTypeGETUrl = BASE_URL + "ticket-types";
// ** GET BY ID ** //
const ticketTypeByIDGETUrl = BASE_URL + "ticket-types/";

// Pass
// ** GET ** //
const listPassesGETUrl = BASE_URL + "passes";
// ** GET BY ID ** //
const passByIDGETUrl = BASE_URL + "passes/";
// UserPass
//** POST **/
const userPassPOSTUrl = BASE_URL + "user-passes";
// *** GET **//
const userPassAvailableGETUrl = BASE_URL + "user-passes/user-pass-avaiable?uId=";
// ** GET HISTORY **//
const userPassHistoryGETUrl = BASE_URL + "user-passes/use-history?userPassId=";

// City
// ** GET ** //
const listCitiesGETUrl = BASE_URL + "cities";

