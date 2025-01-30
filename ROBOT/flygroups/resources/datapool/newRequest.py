import random
import string

def randomName()-> str:
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(6))
    return result_str

group = randomName()

flight_OneWay_1 = {
    'outboundAirport': 'LISBON',
    'arrivalAirport': 'PORTO',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_OneWay_0 = {
    'outboundAirport': 'LISBON',
    'arrivalAirport': 'PORTO',
    'totalPassengers': '15',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_OneWay_2 = {
    'outboundAirport': 'MADRID',
    'arrivalAirport': 'PORTO',
    'totalPassengers': '12',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_OneWay_3 = {
    'outboundAirport': 'MADRID',
    'arrivalAirport': 'BARCELONA',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}


flight_RoundTrip_1 = {
    'outboundAirport': 'AMSTERDAM',
    'arrivalAirport': 'PARIS',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_RoundTrip_2 = {
    'outboundAirport': 'MADRID',
    'arrivalAirport': 'PORTO',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_RoundTrip_3 = {
    'outboundAirport': 'MADRID',
    'arrivalAirport': 'BARCELONA',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_RoundTrip_4 = {
    'outboundAirport': 'PARIS',
    'arrivalAirport': 'BERLIN',
    'totalPassengers': '19',
    'groupType': 'OTHERS',
    'groupName': group
}


flight_MultiCity_1 = {
    'outboundAirport1': 'LISBON',
    'arrivalAirport1': 'MADRID',
    'outboundAirport2': 'PARIS',
    'arrivalAirport2': 'LISBON',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}


flight_MultiCity_2 = {
    'outboundAirport1': 'LISBON',
    'arrivalAirport1': 'PONTA DELGADA',
    'outboundAirport2': 'TERCEIRA',
    'arrivalAirport2': 'LISBON',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

flight_MultiCity_3 = {
    'outboundAirport1': 'FRANKFURT',
    'arrivalAirport1': 'LISBON',
    'outboundAirport2': 'LISBON',
    'arrivalAirport2': 'PARIS',
    'totalPassengers': '10',
    'groupType': 'OTHERS',
    'groupName': group
}

inibit = {
    'outboundAirport': 'PORTO',
    'arrivalAirport': 'LISBON',
    'date': '2024-03-03',
    'totalPassengers': '13',
    'groupType': 'AUCTION',
    'groupName': group
}

messegeRequests = {
    'textRequest': 'Message Request Test',
    'inibFlight': 'Need a queue for this flight',
    'deniedRequestSO': 'Resquest incorrect',
    'contactBySOToRM': 'We need to new flight queue',
    'messageToAgent': 'New offer(RM) to Agent',
    'rejectRequest': 'Reject Message',
    'rejectionSendToAgent': 'Reject by RM'
}

