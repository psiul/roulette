select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,date_dim d,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 219 and cd.cd_hash <= 619 and d.d_hash >= 84 and d.d_hash <= 834 and hd.hd_hash >= 585 and hd.hd_hash <= 918
;
