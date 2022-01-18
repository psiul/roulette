select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,customer_demographics cd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 464 and ws.ws_hash <= 864 and hd.hd_hash >= 81 and hd.hd_hash <= 831 and d.d_hash >= 530 and d.d_hash <= 863
;
