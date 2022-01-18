select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,ship_mode sm,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 471 and ws.ws_hash <= 804 and sm.sm_hash >= 54 and sm.sm_hash <= 804 and i.i_hash >= 513 and i.i_hash <= 913
;
