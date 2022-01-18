select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,customer_demographics cd,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 115 and ws.ws_hash <= 865 and sm.sm_hash >= 496 and sm.sm_hash <= 896 and cd.cd_hash >= 467 and cd.cd_hash <= 800
;
