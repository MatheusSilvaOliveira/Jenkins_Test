def checkFlight(option: str)-> str:
    return "//div[contains(@class, 'details-flight')]//*[contains(text(), '" + option + "')]"



def locatorReturn(option: str, id: str) -> str:
  match option:
    case "detailsNewRequest":
        return "//tr//*[contains(@id, 'block_wtContent') and contains(text(), '" + id + "')]//ancestor::td//following-sibling::td//div[contains(@id,'block_wtLabel') and contains(text(), 'Details')]"
    case "selectFlightGSO":
        return "//td[@class = 'queue-cell groupId' and contains(text(), '" + id + "')]"
    case "selectStatus":
        return "//li[contains(@class, 'active-result')]//*[text() = '" + id + "']"
    case "lookingFlightForStatus":
        return "//*[contains(@id, 'block_wtContent') and contains(text(), '" + id + "')]//parent::a//span"
    case "clickByStatus":
        return "//a//span[contains(text(), '" + id + "')]//ancestor::tr//div[contains(text(), 'Details')]"
    case "clickDetailsInib":
        return "//*[contains(@id, 'block_wtContent') and contains(text(), '" + id + "')]//ancestor::tr//div[contains(text(), 'Details')]"

def checkGSO(name: str, id: str) -> str:
    return "//td[@class = 'queue-cell groupId' and contains(text(), '" + id +"')]//ancestor::tbody//td[@class = 'queue-cell groupName'  and contains(text(), '" + name +"')]"


def locatorIndex(option: str, index: str) -> str:
    match option:
        case "selectTypePassenger":
            return "(//select[contains(@id, '_wtContent_wtPassengerType')])["+ index +"]"
        case "selectTitlePassenger":
            return "(//select[contains(@id, 'wtPAX_Title_ComboBox')])["+ index +"]"
        case "firstNamePassenger":
            return "(//input[contains(@id, 'block_wtContent_wtGivenNameInput')])["+ index +"]"
        case "lastNamePassenger":
            return "(//input[contains(@id, 'block_wtContent_wtSurnameInput')])["+ index +"]"
        case "emailPassenger":
            return "(//input[contains(@id, 'block_wtContent_wtEmailInput')])["+ index +"]"
        case "saveAndClose":
            return "(//div[contains(@id, 'Layout_TAP_wtPassengerSidebar_block_wtActions_Layout_TAP')]//span[contains(text(), 'Save and close')])["+ index +"]"


def getPassengerName(option: str, name: str) -> str:
    match option:
        case "passengerName":
            return "//span[@class = 'grid']//div[contains(@id, 'wtLR_Passengers')]//h5[contains(text(), '" + name + "')]"
        case "checkboxPassenger":
            return "//span[contains(text(), '" + name + "')]"
        

def changeFlight(airport: str) -> str:
    return "//span[@class = 'search-flight__name' and contains(text(),'" + airport + "')]"


def getInibNumber(fullNumber: str, init: int, end: int=None)-> str:
    return fullNumber[init:end]

def optionBrowser()-> str:
    return "add_argument('--ignore-certificate-errors'); add_argument('--headless'); add_argument('--disable-infobars'); add_argument('--no-default-browser-check'); add_argument('--no-first-run'); add_argument('--disable-gpu'); add_argument('--disable-sandbox'); add_argument('--disable-notifications'); add_argument('--disable-dev-shm-usage'); add_argument('--disable-blink-features\=AutomationControlled'); add_argument('--window-size\=1920,1080')" 