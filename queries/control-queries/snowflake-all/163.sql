select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,warehouse w,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and hd.hd_hash >= 441 and hd.hd_hash <= 774 and cd.cd_hash >= 103 and cd.cd_hash <= 853 and d.d_hash >= 528 and d.d_hash <= 928
;
