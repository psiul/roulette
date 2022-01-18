select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 178 and d.d_hash <= 578 and cd.cd_hash >= 214 and cd.cd_hash <= 964 and i.i_hash >= 623 and i.i_hash <= 956
;
