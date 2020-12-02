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

class rc_number {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rc_number = null;
      this.record_number = null;
    }
    else {
      if (initObj.hasOwnProperty('rc_number')) {
        this.rc_number = initObj.rc_number
      }
      else {
        this.rc_number = 0;
      }
      if (initObj.hasOwnProperty('record_number')) {
        this.record_number = initObj.record_number
      }
      else {
        this.record_number = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rc_number
    // Serialize message field [rc_number]
    bufferOffset = _serializer.int16(obj.rc_number, buffer, bufferOffset);
    // Serialize message field [record_number]
    bufferOffset = _serializer.int16(obj.record_number, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rc_number
    let len;
    let data = new rc_number(null);
    // Deserialize message field [rc_number]
    data.rc_number = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [record_number]
    data.record_number = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'whatever/rc_number';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '864afb57b68d8c11afa6468b1766e735';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 rc_number
    int16 record_number
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rc_number(null);
    if (msg.rc_number !== undefined) {
      resolved.rc_number = msg.rc_number;
    }
    else {
      resolved.rc_number = 0
    }

    if (msg.record_number !== undefined) {
      resolved.record_number = msg.record_number;
    }
    else {
      resolved.record_number = 0
    }

    return resolved;
    }
};

module.exports = rc_number;
