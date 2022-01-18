select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,web_returns wr,customer_demographics cd,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 661 and ws.ws_hash <= 994 and sm.sm_hash >= 182 and sm.sm_hash <= 582 and cd.cd_hash >= 209 and cd.cd_hash <= 959
;
