select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,ship_mode sm,web_returns wr
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 599 and ws.ws_hash <= 932 and cd.cd_hash >= 57 and cd.cd_hash <= 807 and sm.sm_hash >= 83 and sm.sm_hash <= 483
;
