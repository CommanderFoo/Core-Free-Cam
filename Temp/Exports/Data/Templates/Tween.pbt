Assets {
  Id: 43175348915832587
  Name: "Tween"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 13700681209904791545
      Objects {
        Id: 13700681209904791545
        Name: "TemplateBundleDummy"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        Folder {
          BundleDummy {
            ReferencedAssets {
              Id: 5010859578220487614
            }
            ReferencedAssets {
              Id: 4450535636412507475
            }
            ReferencedAssets {
              Id: 5576294122610321325
            }
          }
        }
        IsReplicationEnabledByDefault: true
      }
    }
    Assets {
      Id: 5576294122610321325
      Name: "Tween_Ticker"
      PlatformAssetType: 3
      TextAsset {
        Text: "---@class Tween_Ticker\r\nlocal Tween_Ticker = {}\r\n\r\nfunction Tween_Ticker:tick(fn)\r\n\tself.st = time()\r\n\r\n\tself.ticking_task = Task.Spawn(function()\r\n\t\tself.dt = time() - self.st\r\n\r\n\t\tfn(self.dt)\r\n\tend)\r\n\r\n\tself.ticking_task.repeatCount = -1\r\nend\r\n\r\nfunction Tween_Ticker:cancel()\r\n\tif(self.ticking_task ~= nil) then\r\n\t\tself.ticking_task:Cancel()\r\n\t\tself.ticking_task = nil\r\n\tend\r\nend\r\n\r\nfunction Tween_Ticker:new()\r\n\tself.__index = self\r\n\r\n\treturn setmetatable({}, self)\r\nend\r\n\r\nreturn Tween_Ticker"
        CustomParameters {
        }
      }
      Marketplace {
        Description: "My custom tween library."
      }
      DirectlyPublished: true
      VirtualFolderPath: "Tween"
    }
    Assets {
      Id: 4450535636412507475
      Name: "Tween_Easings"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\nDisclaimer for Robert Penner\'s Easing Equations license:\r\n\r\nTERMS OF USE - EASING EQUATIONS\r\n\r\nOpen source under the BSD License.\r\n\r\nCopyright \302\251 2001 Robert Penner\r\nAll rights reserved.\r\n\r\nRedistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\r\n\r\n    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\r\n    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\r\n    * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.\r\n\r\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\r\n]]\r\n\r\n-- For all easing functions:\r\n-- t = elapsed time\r\n-- b = begin\r\n-- c = change == ending - beginning\r\n-- d = duration (total time)\r\n\r\nlocal pow = function(a, b)\r\n    return a ^ b\r\nend\r\n\r\nlocal sin = math.sin\r\nlocal cos = math.cos\r\nlocal pi = math.pi\r\nlocal sqrt = math.sqrt\r\nlocal abs = math.abs\r\nlocal asin  = math.asin\r\n\r\nlocal function linear(t, b, c, d)\r\n  return c * t / d + b\r\nend\r\n\r\nlocal function inQuad(t, b, c, d)\r\n  t = t / d\r\n  return c * pow(t, 2) + b\r\nend\r\n\r\nlocal function outQuad(t, b, c, d)\r\n  t = t / d\r\n  return -c * t * (t - 2) + b\r\nend\r\n\r\nlocal function inOutQuad(t, b, c, d)\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * pow(t, 2) + b\r\n  else\r\n    return -c / 2 * ((t - 1) * (t - 3) - 1) + b\r\n  end\r\nend\r\n\r\nlocal function outInQuad(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outQuad (t * 2, b, c / 2, d)\r\n  else\r\n    return inQuad((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inCubic (t, b, c, d)\r\n  t = t / d\r\n  return c * pow(t, 3) + b\r\nend\r\n\r\nlocal function outCubic(t, b, c, d)\r\n  t = t / d - 1\r\n  return c * (pow(t, 3) + 1) + b\r\nend\r\n\r\nlocal function inOutCubic(t, b, c, d)\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * t * t * t + b\r\n  else\r\n    t = t - 2\r\n    return c / 2 * (t * t * t + 2) + b\r\n  end\r\nend\r\n\r\nlocal function outInCubic(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outCubic(t * 2, b, c / 2, d)\r\n  else\r\n    return inCubic((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inQuart(t, b, c, d)\r\n  t = t / d\r\n  return c * pow(t, 4) + b\r\nend\r\n\r\nlocal function outQuart(t, b, c, d)\r\n  t = t / d - 1\r\n  return -c * (pow(t, 4) - 1) + b\r\nend\r\n\r\nlocal function inOutQuart(t, b, c, d)\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * pow(t, 4) + b\r\n  else\r\n    t = t - 2\r\n    return -c / 2 * (pow(t, 4) - 2) + b\r\n  end\r\nend\r\n\r\nlocal function outInQuart(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outQuart(t * 2, b, c / 2, d)\r\n  else\r\n    return inQuart((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inQuint(t, b, c, d)\r\n  t = t / d\r\n  return c * pow(t, 5) + b\r\nend\r\n\r\nlocal function outQuint(t, b, c, d)\r\n  t = t / d - 1\r\n  return c * (pow(t, 5) + 1) + b\r\nend\r\n\r\nlocal function inOutQuint(t, b, c, d)\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * pow(t, 5) + b\r\n  else\r\n    t = t - 2\r\n    return c / 2 * (pow(t, 5) + 2) + b\r\n  end\r\nend\r\n\r\nlocal function outInQuint(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outQuint(t * 2, b, c / 2, d)\r\n  else\r\n    return inQuint((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inSine(t, b, c, d)\r\n  return -c * cos(t / d * (pi / 2)) + c + b\r\nend\r\n\r\nlocal function outSine(t, b, c, d)\r\n  return c * sin(t / d * (pi / 2)) + b\r\nend\r\n\r\nlocal function inOutSine(t, b, c, d)\r\n  return -c / 2 * (cos(pi * t / d) - 1) + b\r\nend\r\n\r\nlocal function outInSine(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outSine(t * 2, b, c / 2, d)\r\n  else\r\n    return inSine((t * 2) -d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inExpo(t, b, c, d)\r\n  if t == 0 then\r\n    return b\r\n  else\r\n    return c * pow(2, 10 * (t / d - 1)) + b - c * 0.001\r\n  end\r\nend\r\n\r\nlocal function outExpo(t, b, c, d)\r\n  if t == d then\r\n    return b + c\r\n  else\r\n    return c * 1.001 * (-pow(2, -10 * t / d) + 1) + b\r\n  end\r\nend\r\n\r\nlocal function inOutExpo(t, b, c, d)\r\n  if t == 0 then return b end\r\n  if t == d then return b + c end\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * pow(2, 10 * (t - 1)) + b - c * 0.0005\r\n  else\r\n    t = t - 1\r\n    return c / 2 * 1.0005 * (-pow(2, -10 * t) + 2) + b\r\n  end\r\nend\r\n\r\nlocal function outInExpo(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outExpo(t * 2, b, c / 2, d)\r\n  else\r\n    return inExpo((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inCirc(t, b, c, d)\r\n  t = t / d\r\n  return(-c * (sqrt(1 - pow(t, 2)) - 1) + b)\r\nend\r\n\r\nlocal function outCirc(t, b, c, d)\r\n  t = t / d - 1\r\n  return(c * sqrt(1 - pow(t, 2)) + b)\r\nend\r\n\r\nlocal function inOutCirc(t, b, c, d)\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return -c / 2 * (sqrt(1 - t * t) - 1) + b\r\n  else\r\n    t = t - 2\r\n    return c / 2 * (sqrt(1 - t * t) + 1) + b\r\n  end\r\nend\r\n\r\nlocal function outInCirc(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outCirc(t * 2, b, c / 2, d)\r\n  else\r\n    return inCirc((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\nlocal function inElastic(t, b, c, d, a, p)\r\n  if t == 0 then return b end\r\n\r\n  t = t / d\r\n\r\n  if t == 1  then return b + c end\r\n\r\n  if not p then p = d * 0.3 end\r\n\r\n  local s\r\n\r\n  if not a or a < abs(c) then\r\n    a = c\r\n    s = p / 4\r\n  else\r\n    s = p / (2 * pi) * asin(c/a)\r\n  end\r\n\r\n  t = t - 1\r\n\r\n  return -(a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b\r\nend\r\n\r\n-- a: amplitud\r\n-- p: period\r\nlocal function outElastic(t, b, c, d, a, p)\r\n  if t == 0 then return b end\r\n\r\n  t = t / d\r\n\r\n  if t == 1 then return b + c end\r\n\r\n  if not p then p = d * 0.3 end\r\n\r\n  local s\r\n\r\n  if not a or a < abs(c) then\r\n    a = c\r\n    s = p / 4\r\n  else\r\n    s = p / (2 * pi) * asin(c/a)\r\n  end\r\n\r\n  return a * pow(2, -10 * t) * sin((t * d - s) * (2 * pi) / p) + c + b\r\nend\r\n\r\n-- p = period\r\n-- a = amplitud\r\nlocal function inOutElastic(t, b, c, d, a, p)\r\n  if t == 0 then return b end\r\n\r\n  t = t / d * 2\r\n\r\n  if t == 2 then return b + c end\r\n\r\n  if not p then p = d * (0.3 * 1.5) end\r\n  if not a then a = 0 end\r\n\r\n  local s\r\n\r\n  if not a or a < abs(c) then\r\n    a = c\r\n    s = p / 4\r\n  else\r\n    s = p / (2 * pi) * asin(c / a)\r\n  end\r\n\r\n  if t < 1 then\r\n    t = t - 1\r\n    return -0.5 * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * pi) / p)) + b\r\n  else\r\n    t = t - 1\r\n    return a * pow(2, -10 * t) * sin((t * d - s) * (2 * pi) / p ) * 0.5 + c + b\r\n  end\r\nend\r\n\r\n-- a: amplitud\r\n-- p: period\r\nlocal function outInElastic(t, b, c, d, a, p)\r\n  if t < d / 2 then\r\n    return outElastic(t * 2, b, c / 2, d, a, p)\r\n  else\r\n    return inElastic((t * 2) - d, b + c / 2, c / 2, d, a, p)\r\n  end\r\nend\r\n\r\nlocal function inBack(t, b, c, d, s)\r\n  if not s then s = 1.70158 end\r\n  t = t / d\r\n  return c * t * t * ((s + 1) * t - s) + b\r\nend\r\n\r\nlocal function outBack(t, b, c, d, s)\r\n  if not s then s = 1.70158 end\r\n  t = t / d - 1\r\n  return c * (t * t * ((s + 1) * t + s) + 1) + b\r\nend\r\n\r\nlocal function inOutBack(t, b, c, d, s)\r\n  if not s then s = 1.70158 end\r\n  s = s * 1.525\r\n  t = t / d * 2\r\n  if t < 1 then\r\n    return c / 2 * (t * t * ((s + 1) * t - s)) + b\r\n  else\r\n    t = t - 2\r\n    return c / 2 * (t * t * ((s + 1) * t + s) + 2) + b\r\n  end\r\nend\r\n\r\nlocal function outInBack(t, b, c, d, s)\r\n  if t < d / 2 then\r\n    return outBack(t * 2, b, c / 2, d, s)\r\n  else\r\n    return inBack((t * 2) - d, b + c / 2, c / 2, d, s)\r\n  end\r\nend\r\n\r\nlocal function outBounce(t, b, c, d)\r\n  t = t / d\r\n  if t < 1 / 2.75 then\r\n    return c * (7.5625 * t * t) + b\r\n  elseif t < 2 / 2.75 then\r\n    t = t - (1.5 / 2.75)\r\n    return c * (7.5625 * t * t + 0.75) + b\r\n  elseif t < 2.5 / 2.75 then\r\n    t = t - (2.25 / 2.75)\r\n    return c * (7.5625 * t * t + 0.9375) + b\r\n  else\r\n    t = t - (2.625 / 2.75)\r\n    return c * (7.5625 * t * t + 0.984375) + b\r\n  end\r\nend\r\n\r\nlocal function inBounce(t, b, c, d)\r\n  return c - outBounce(d - t, 0, c, d) + b\r\nend\r\n\r\nlocal function inOutBounce(t, b, c, d)\r\n  if t < d / 2 then\r\n    return inBounce(t * 2, 0, c, d) * 0.5 + b\r\n  else\r\n    return outBounce(t * 2 - d, 0, c, d) * 0.5 + c * .5 + b\r\n  end\r\nend\r\n\r\nlocal function outInBounce(t, b, c, d)\r\n  if t < d / 2 then\r\n    return outBounce(t * 2, b, c / 2, d)\r\n  else\r\n    return inBounce((t * 2) - d, b + c / 2, c / 2, d)\r\n  end\r\nend\r\n\r\n---@class Easings\r\nlocal Easings = {\r\n\r\n  Linear = linear,\r\n  In_Quad = inQuad,\r\n  Out_Quad = outQuad,\r\n  In_Out_Quad = inOutQuad,\r\n  Out_In_Quad = outInQuad,\r\n  In_Cubic  = inCubic ,\r\n  Out_Cubic = outCubic,\r\n  In_Out_Cubic = inOutCubic,\r\n  Out_In_Cubic = outInCubic,\r\n  In_Quart = inQuart,\r\n  Out_Quart = outQuart,\r\n  In_Out_Quart = inOutQuart,\r\n  Out_In_Quart = outInQuart,\r\n  In_Quint = inQuint,\r\n  Out_Quint = outQuint,\r\n  In_Out_Quint = inOutQuint,\r\n  Out_In_Quint = outInQuint,\r\n  In_Sine = inSine,\r\n  Out_Sine = outSine,\r\n  In_Out_Sine = inOutSine,\r\n  Out_In_Sine = outInSine,\r\n  In_Expo = inExpo,\r\n  Out_Expo = outExpo,\r\n  In_Out_Expo = inOutExpo,\r\n  Out_In_Expo = outInExpo,\r\n  In_Circ = inCirc,\r\n  Out_Circ = outCirc,\r\n  In_Out_Circ = inOutCirc,\r\n  Out_In_Circ = outInCirc,\r\n  In_Elastic = inElastic,\r\n  Out_Elastic = outElastic,\r\n  In_Out_Elastic = inOutElastic,\r\n  Out_In_Elastic = outInElastic,\r\n  In_Back = inBack,\r\n  Out_Back = outBack,\r\n  In_Out_Back = inOutBack,\r\n  Out_In_Back = outInBack,\r\n  In_Bounce = inBounce,\r\n  Out_Bounce = outBounce,\r\n  In_Out_Bounce = inOutBounce,\r\n  Out_In_Bounce = outInBounce\r\n\r\n}\r\n\r\nreturn Easings"
        CustomParameters {
        }
      }
      Marketplace {
        Description: "My custom tween library."
      }
      DirectlyPublished: true
      VirtualFolderPath: "Tween"
    }
    Assets {
      Id: 5010859578220487614
      Name: "Tween"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\nThe MIT License (MIT)\r\n\r\nCopyright (c) 2022 pixeldepth.net\r\n\r\nPermission is hereby granted, free of charge, to any person obtaining a copy\r\nof this software and associated documentation files (the \"Software\"), to deal\r\nin the Software without restriction, including without limitation the rights\r\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\r\ncopies of the Software, and to permit persons to whom the Software is\r\nfurnished to do so, subject to the following conditions:\r\n\r\nThe above copyright notice and this permission notice shall be included in all\r\ncopies or substantial portions of the Software.\r\n\r\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\r\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\r\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\r\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\r\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\r\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\r\nSOFTWARE.\r\n\r\nAuthor: CommanderFoo\r\n\r\nThis hasn\'t been released, it\'s my own Tween library I created. Feel free to\r\nuse it. It\'s not beginner friendly, but it\'s powerful.\r\n\r\n]]\r\n\r\n---@class Tween\r\nlocal Tween = {\r\n\r\n\tid = 0,\r\n\r\n\t---@class Easings\r\n\tEasings = require(script:GetCustomProperty(\"Tween_Easings\"))\r\n\r\n}\r\n\r\nTween.ease = function(from, to, original, time, duration, ease)\r\n\tfor k, v in pairs(to) do\r\n\t\tlocal t = time\r\n\t\tlocal b = original[k]\r\n\t\tlocal c = v - original[k]\r\n\t\tlocal d = duration\r\n\r\n\t\tif(type(ease) == \"userdata\" and ease.type == \"SimpleCurve\") then\r\n\t\t\tlocal val = ease:GetValue(t / duration)\r\n\r\n\t\t\tfrom[k] = c * val + b\r\n\t\telse\r\n\t\t\tfrom[k] = ease(t, b, c, d)\r\n\t\tend\r\n\tend\r\n\r\n\treturn from\r\nend\r\n\r\nTween.copy_table = function(t)\r\n\tlocal tmp = {}\r\n\r\n\tfor k, v in pairs(t) do\r\n\t\ttmp[k] = v\r\n\tend\r\n\r\n\treturn tmp\r\nend\r\n\r\nfunction Tween:tween(delta)\r\n\tif(self.tween_finished) then\r\n\t\tif(not self.kill) then\r\n\t\t\treturn self\r\n\t\tend\r\n\r\n\t\treturn nil\r\n\tend\r\n\r\n\tif(self.tween_paused) then\r\n\t\treturn self\r\n\tend\r\n\r\n\tself.time = self.time + delta\r\n\r\n\tif(self.time < self.delay_tween) then\r\n\t\treturn\r\n\tend\r\n\r\n\tself.original = self.original or Tween.copy_table(self.from)\r\n\r\n\tif((self.time - self.delay_tween) >= self.duration) then\r\n\t\tself.from = Tween.copy_table(self.to)\r\n\r\n\t\tif(type(self.change_evt) == \"function\") then\r\n\t\t\tself.change_evt(self.to)\r\n\t\tend\r\n\r\n\t\tself.tween_finished = true\r\n\r\n\t\tif(type(self.complete_evt) == \"function\") then\r\n\t\t\tself.complete_evt()\r\n\t\tend\r\n\r\n\t\tif(self.kill) then\r\n\t\t\treturn nil\r\n\t\tend\r\n\telse\r\n\t\tif(self.start_evt and not self.start_evt_invoked) then\r\n\t\t\tself.start_evt()\r\n\t\t\tself.start_evt_invoked = true\r\n\t\tend\r\n\r\n\t\tself.from = Tween.ease(self.from, self.to, self.original, self.time - self.delay_tween, self.duration, self.easing)\r\n\r\n\t\tif(type(self.change_evt) == \"function\") then\r\n\t\t\tself.change_evt(self.from)\r\n\t\tend\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:kill_on_complete(value)\r\n\tself.kill = value\r\nend\r\n\r\nfunction Tween:on_change(fn)\r\n\tif(fn and type(fn) == \"function\" and self.change_evt == nil) then\r\n\t\tself.change_evt = fn\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:set_from(from)\r\n\tself.original = from\r\nend\r\n\r\nfunction Tween:reset()\r\n\tself.time = 0\r\n\r\n\tself.from = Tween.copy_table(self.original_from)\r\n\tself.to = Tween.copy_table(self.original_to)\r\n\r\n\tself.start_evt_invoked = false\r\n\tself.original = nil\r\n\tself.tween_finished = false\r\n\tself.tween_paused = false\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:set_easing(ease)\r\n\tif(ease ~= nil) then\r\n\t\tself.easing = ease or Tween.Easings.Linear\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:on_complete(fn)\r\n\tif(fn and type(fn) == \"function\" and self.complete_evt == nil) then\r\n\t\tself.complete_evt = fn\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:on_start(fn)\r\n\tif(fn and type(fn) == \"function\" and self.start_evt == nil) then\r\n\t\tself.start_evt = fn\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:set_delay(delay_time)\r\n\tif(delay_time and delay_time > 0) then\r\n\t\tself.delay_tween = delay_time\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:paused()\r\n\treturn self.tween_paused\r\nend\r\n\r\nfunction Tween:pause()\r\n\tself.tween_paused = true\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:continue()\r\n\tself.tween_paused = false\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:play()\r\n\tself.tween_paused = false\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:stop()\r\n\tself.tween_finished = true\r\n\tself.tween_paused = false\r\n\r\n\tif(self.complete_evt and type(self.complete_evt) == \"function\") then\r\n\t\tself.complete_evt()\r\n\tend\r\n\r\n\treturn self\r\nend\r\n\r\nfunction Tween:active()\r\n\treturn not self.tween_finished\r\nend\r\n\r\nfunction Tween:get_id()\r\n\treturn \"tween_\" .. tostring(self.id)\r\nend\r\n\r\nfunction Tween:new(duration, from, to, easing, change, complete)\r\n\tself.__index = self\r\n\r\n\tTween.id = Tween.id + 1\r\n\r\n\tlocal m_table = setmetatable({\r\n\r\n\t\tduration = duration,\r\n\t\tfrom = from,\r\n\t\tto = to,\r\n\t\ttime = 0,\r\n\t\ttween_finished = false,\r\n\t\tcomplete_evt = nil,\r\n\t\tstart_evt = nil,\r\n\t\teasing = easing or Tween.Easings.Linear,\r\n\t\tdelay_tween = 0,\r\n\t\ttime_started = 0,\r\n\t\toriginal_from = Tween.copy_table(from),\r\n\t\toriginal_to = Tween.copy_table(to),\r\n\t\tchange_evt = nil,\r\n\t\tstart_evt_invoked = false,\r\n\t\ttween_paused = false,\r\n\t\tid = Tween.id,\r\n\t\tkill = true\r\n\r\n\t}, self)\r\n\r\n\tm_table:on_change(change)\r\n\tm_table:on_complete(complete)\r\n\r\n\treturn m_table\r\nend\r\n\r\nreturn Tween"
        CustomParameters {
          Overrides {
            Name: "cs:Tween_Easings"
            AssetReference {
              Id: 4450535636412507475
            }
          }
        }
      }
      Marketplace {
        Description: "My custom tween library."
      }
      DirectlyPublished: true
      VirtualFolderPath: "Tween"
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Id: "bd2dd6ad784d458abb2af834bf4b97ff"
    OwnerAccountId: "93d6eaf2514940a08c5481a4c03c1ee3"
    OwnerName: "CommanderFoo"
    Version: "1.8.0"
    Description: "My custom tween library."
  }
  SerializationVersion: 118
}
IncludesAllDependencies: true
