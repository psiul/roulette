select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,ship_mode sm,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 524 and c.c_hash <= 924 and sm.sm_hash >= 76 and sm.sm_hash <= 826 and cd.cd_hash >= 197 and cd.cd_hash <= 530
;
