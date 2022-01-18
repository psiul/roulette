select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,customer_demographics cd,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 118 and ws.ws_hash <= 451 and i.i_hash >= 124 and i.i_hash <= 874 and sm.sm_hash >= 530 and sm.sm_hash <= 930
;
