select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 84 and ss.ss_hash <= 484 and d.d_hash >= 242 and d.d_hash <= 992 and hd.hd_hash >= 131 and hd.hd_hash <= 464
;
