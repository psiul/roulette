select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,warehouse w,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 369 and d.d_hash <= 769 and cd.cd_hash >= 578 and cd.cd_hash <= 911 and sm.sm_hash >= 45 and sm.sm_hash <= 795
;
