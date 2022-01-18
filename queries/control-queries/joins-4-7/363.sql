select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 240 and ss.ss_hash <= 640 and hd.hd_hash >= 635 and hd.hd_hash <= 968 and cd.cd_hash >= 103 and cd.cd_hash <= 853
;
