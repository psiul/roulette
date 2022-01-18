select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,web_returns wr,ship_mode sm,reason r
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 278 and ws.ws_hash <= 678 and cd.cd_hash >= 653 and cd.cd_hash <= 986 and sm.sm_hash >= 140 and sm.sm_hash <= 890
;
