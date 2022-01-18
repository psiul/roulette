select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 248 and ss.ss_hash <= 998 and d.d_hash >= 537 and d.d_hash <= 870 and cd.cd_hash >= 417 and cd.cd_hash <= 817
;
