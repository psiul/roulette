select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 556 and ss.ss_hash <= 956 and hd.hd_hash >= 46 and hd.hd_hash <= 796 and cd.cd_hash >= 141 and cd.cd_hash <= 474
;
