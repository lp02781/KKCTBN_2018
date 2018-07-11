// Auto-generated. Do not edit!

// (in-package whatever.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class image_process {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.setpoint = null;
      this.state_red = null;
      this.state_green = null;
      this.count_red = null;
      this.count_green = null;
    }
    else {
      if (initObj.hasOwnProperty('setpoint')) {
        this.setpoint = initObj.setpoint
      }
      else {
        this.setpoint = 0;
      }
      if (initObj.hasOwnProperty('state_red')) {
        this.state_red = initObj.state_red
      }
      else {
        this.state_red = 0;
      }
      if (initObj.hasOwnProperty('state_green')) {
        this.state_green = initObj.state_green
      }
      else {
        this.state_green = 0;
      }
      if (initObj.hasOwnProperty('count_red')) {
        this.count_red = initObj.count_red
      }
      else {
        this.count_red = 0;
      }
      if (initObj.hasOwnProperty('count_green')) {
        this.count_green = initObj.count_green
      }
      else {
        this.count_green = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type image_process
    // Serialize message field [setpoint]
    bufferOffset = _serializer.int16(obj.setpoint, buffer, bufferOffset);
    // Serialize message field [state_red]
    bufferOffset = _serializer.int16(obj.state_red, buffer, bufferOffset);
    // Serialize message field [state_green]
    bufferOffset = _serializer.int16(obj.state_green, buffer, bufferOffset);
    // Serialize message field [count_red]
    bufferOffset = _serializer.int16(obj.count_red, buffer, bufferOffset);
    // Serialize message field [count_green]
    bufferOffset = _serializer.int16(obj.count_green, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type image_process
    let len;
    let data = new image_process(null);
    // Deserialize message field [setpoint]
    data.setpoint = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [state_red]
    data.state_red = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [state_green]
    data.state_green = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [count_red]
    data.count_red = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [count_green]
    data.count_green = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/image_process';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '718b8e0ae302cbf8067f998190df9579';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 setpoint
    int16 state_red
    int16 state_green
    int16 count_red
    int16 count_green
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new image_process(null);
    if (msg.setpoint !== undefined) {
      resolved.setpoint = msg.setpoint;
    }
    else {
      resolved.setpoint = 0
    }

    if (msg.state_red !== undefined) {
      resolved.state_red = msg.state_red;
    }
    else {
      resolved.state_red = 0
    }

    if (msg.state_green !== undefined) {
      resolved.state_green = msg.state_green;
    }
    else {
      resolved.state_green = 0
    }

    if (msg.count_red !== undefined) {
      resolved.count_red = msg.count_red;
    }
    else {
      resolved.count_red = 0
    }

    if (msg.count_green !== undefined) {
      resolved.count_green = msg.count_green;
    }
    else {
      resolved.count_green = 0
    }

    return resolved;
    }
};

module.exports = image_process;
