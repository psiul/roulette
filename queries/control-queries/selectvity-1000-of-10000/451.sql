select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 615 and cd.cd_hash <= 948 and d.d_hash >= 206 and d.d_hash <= 606 and hd.hd_hash >= 45 and hd.hd_hash <= 795
;
