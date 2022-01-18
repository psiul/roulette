select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 91 and hd.hd_hash <= 424 and cd.cd_hash >= 523 and cd.cd_hash <= 923 and d.d_hash >= 228 and d.d_hash <= 978
;
