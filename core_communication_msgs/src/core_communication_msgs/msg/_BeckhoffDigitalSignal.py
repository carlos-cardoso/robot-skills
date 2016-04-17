"""autogenerated by genpy from core_communication_msgs/BeckhoffDigitalSignal.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class BeckhoffDigitalSignal(genpy.Message):
  _md5sum = "86287f079e27c31f59c610d87337e525"
  _type = "core_communication_msgs/BeckhoffDigitalSignal"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# This message contains the state of a specific out or input on a Beckhoff terminal.
string terminal # terminal type (e.g. EL1014)
uint8 position # relative position of the terminal in the ethercat bus (0-n)
uint8 port # specifies the port on the selected terminal (0-n)
bool state # the state of the port

"""
  __slots__ = ['terminal','position','port','state']
  _slot_types = ['string','uint8','uint8','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       terminal,position,port,state

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(BeckhoffDigitalSignal, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.terminal is None:
        self.terminal = ''
      if self.position is None:
        self.position = 0
      if self.port is None:
        self.port = 0
      if self.state is None:
        self.state = False
    else:
      self.terminal = ''
      self.position = 0
      self.port = 0
      self.state = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.terminal
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_3B.pack(_x.position, _x.port, _x.state))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.terminal = str[start:end].decode('utf-8')
      else:
        self.terminal = str[start:end]
      _x = self
      start = end
      end += 3
      (_x.position, _x.port, _x.state,) = _struct_3B.unpack(str[start:end])
      self.state = bool(self.state)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.terminal
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_3B.pack(_x.position, _x.port, _x.state))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.terminal = str[start:end].decode('utf-8')
      else:
        self.terminal = str[start:end]
      _x = self
      start = end
      end += 3
      (_x.position, _x.port, _x.state,) = _struct_3B.unpack(str[start:end])
      self.state = bool(self.state)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3B = struct.Struct("<3B")