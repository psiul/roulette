select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,customer_demographics cd,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 47 and ws.ws_hash <= 797 and i.i_hash >= 559 and i.i_hash <= 892 and c.c_hash >= 514 and c.c_hash <= 914
;
