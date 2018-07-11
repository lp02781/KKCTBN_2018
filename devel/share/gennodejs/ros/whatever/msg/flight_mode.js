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

class flight_mode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flight_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('flight_mode')) {
        this.flight_mode = initObj.flight_mode
      }
      else {
        this.flight_mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type flight_mode
    // Serialize message field [flight_mode]
    bufferOffset = _serializer.string(obj.flight_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type flight_mode
    let len;
    let data = new flight_mode(null);
    // Deserialize message field [flight_mode]
    data.flight_mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.flight_mode.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/flight_mode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ec7751446dccbf592ba3e57dd292976';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string flight_mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new flight_mode(null);
    if (msg.flight_mode !== undefined) {
      resolved.flight_mode = msg.flight_mode;
    }
    else {
      resolved.flight_mode = ''
    }

    return resolved;
    }
};

module.exports = flight_mode;
