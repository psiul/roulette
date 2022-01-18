select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,customer_demographics cd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and hd.hd_hash >= 92 and hd.hd_hash <= 492 and cd.cd_hash >= 47 and cd.cd_hash <= 797 and i.i_hash >= 355 and i.i_hash <= 688
;
