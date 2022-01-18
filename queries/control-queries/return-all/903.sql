select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,customer c,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 37 and ws.ws_hash <= 787 and sm.sm_hash >= 129 and sm.sm_hash <= 529 and cd.cd_hash >= 481 and cd.cd_hash <= 814
;
