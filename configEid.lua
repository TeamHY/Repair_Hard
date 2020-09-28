----------
--CONFIG--
----------


    EIDConfig={

      	--** = 다음의 숫자 또는 값을 수정해주세요.
      	--** 반점이나 따옴표를 지울 시 제대로 작동되지 않습니다.
      	--** true = 켜짐, false = 꺼짐

      	--------설정---------

      	-- 텍스트박스의 넓이를 설정합니다.
      	-- 기본 = 30
      	["TextboxWidth"] = 30,

      	-- 텍스트박스의 크기 비율을 설정합니다.
      	-- 기본 = 1
      	["Scale"] = 1,

      	-- 글자의 불투명도를 설정합니다.
      	-- 값: 0 ~ 1
      	-- 기본 = 0.7
      	["Transparency"] = 0.35,

      	-- 텍스트박스의 X좌표 위치를 설정합니다.
      	-- 기본 = 50
      	["XPosition"] = 75,

          	-- 텍스트박스의 Y좌표 위치를 설정합니다.
      	-- 기본 = 33
      	["YPosition"] = 33,

      	-- 아이템이 인식되는 범위를 설정합니다.
      	-- 기본 = 3
      	["MaxDistance"] = 3,

      	-- 설명 출력중인 아이템의 표시방법을 설정합니다.
      	-- 값: arrow(화살표), blink(깜빡임), highlight(테두리), border(테두리 깜빡임), none(없음)
      	["Indicator"] = "arrow",

      	-- 아이템이 보이지 않는 저주(블라인드) 상태에서 아이템을 설명을 출력할 지 설정합니다.
      	-- 기본 = false
      	["DisableOnCurse"] = false,

      	-- 장신구 설명을 출력할 지 설정합니다.
      	-- 기본 = true
      	["DisplayTrinketInfo"] = true,

      	-- 카드 또는 룬의 정보를 출력할 지 설정합니다.
          	-- 기본 = true
      	["DisplayCardInfo"] = true,

      	-- 상점에서 판매중인 카드 또는 룬의 정보를 출력할 지 설정합니다.
      	-- 기본 = false
      	["DisplayCardInfoShop"] = false,

      	-- 오류 메세지 출력 문장을 설정합니다.
      	["ErrorMessage"] = "[Effects not found]",

      	-- 설명문의 색을 조정합니다. (RGB)
      	-- 기본 = { 1, 1, 1}
      	["TextColor"] = {1,1,1},
      	-- 오류 안내문의 색을 조정합니다. (RGB)
      	-- 기본 = { 1, 0, 0}
      	["ErrorColor"] = {1,0.4,0.4},

      	-- 모드 아이템의 설명을 출력할 지 설정합니다.
      	-- 기본 = false
      	["EnableEntityDescriptions"] = true

    }

      --END CONFIG--
      -----------
      -----------
      --Mod compatibility thing--

      EIDConfig:ForceError()
