import time
import json
import random
from azure.eventhub import EventHubProducerClient, EventData

EVENT_HUB_CONNECTION_STRING = "Connection String"
EVENT_HUB_NAME = "event hub name"

producer = EventHubProducerClient.from_connection_string(
    conn_str=EVENT_HUB_CONNECTION_STRING,
    eventhub_name=EVENT_HUB_NAME
)

def generate_sample_data():
    sample_data = {
        "temperature": round(random.uniform(-10, 40), 1),
        "humidity": random.randint(10, 100),
        "windSpeed": round(random.uniform(0, 30), 1),
        "windDirection": random.choice(["N", "NE", "E", "SE", "S", "SW", "W", "NW"]),
        "precipitation": round(random.uniform(0, 50), 1),
        "conditions": random.choice(["Sunny", "Partly_Cloudy", "Overcast", "Rain", "Snow"])
    }
    return sample_data

def send_events():
    try:
        while True:
            event_data_batch = producer.create_batch()
            data = generate_sample_data()
            event_data_batch.add(EventData(json.dumps(data)))
            producer.send_batch(event_data_batch)
            print(f"Sent a batch of events: {event_data_batch}")
            time.sleep(2)
    except KeyboardInterrupt:
        print("Event generation stopped.")
    except Exception as e:
        print(f"Error occurred: {e}")
    finally:
        producer.close()

if __name__ == "__main__":
    send_events()
