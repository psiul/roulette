select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,web_returns wr,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 224 and cd.cd_hash <= 974 and sm.sm_hash >= 11 and sm.sm_hash <= 344 and hd.hd_hash >= 400 and hd.hd_hash <= 800
;
