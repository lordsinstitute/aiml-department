import hashlib
import json
from time import time
from datetime import datetime

class Blockchain:

    def __init__(self):
        self.chain = []
        self.create_block({
            "type": "Genesis",
            "user": "System",
            "result": "Start"
        })

    def create_block(self, data):

        block = {
            "index": len(self.chain) + 1,
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "data": data,
            "prev_hash": self.chain[-1]["hash"] if self.chain else "0"
        }

        # IMPORTANT: hash without hash field
        encoded_block = json.dumps(block, sort_keys=True).encode()

        block["hash"] = hashlib.sha256(encoded_block).hexdigest()

        self.chain.append(block)

        return block

    def get_chain(self):
        return self.chain

    def get_latest_block(self):
        return self.chain[-1]

    def get_length(self):
        return len(self.chain)


# Global instance
blockchain = Blockchain()