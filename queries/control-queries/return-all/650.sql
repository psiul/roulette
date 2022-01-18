select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,customer_demographics cd,web_returns wr
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 126 and ws.ws_hash <= 526 and hd.hd_hash >= 154 and hd.hd_hash <= 904 and sm.sm_hash >= 316 and sm.sm_hash <= 649
;
