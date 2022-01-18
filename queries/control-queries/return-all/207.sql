select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,web_returns wr,customer_demographics cd,reason r
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 262 and ws.ws_hash <= 662 and sm.sm_hash >= 642 and sm.sm_hash <= 975 and cd.cd_hash >= 118 and cd.cd_hash <= 868
;
