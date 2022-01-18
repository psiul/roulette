select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,warehouse w,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 439 and i.i_hash <= 772 and cd.cd_hash >= 72 and cd.cd_hash <= 822 and sm.sm_hash >= 341 and sm.sm_hash <= 741
;
