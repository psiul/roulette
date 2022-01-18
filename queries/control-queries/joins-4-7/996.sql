select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 443 and ss.ss_hash <= 776 and d.d_hash >= 269 and d.d_hash <= 669 and hd.hd_hash >= 9 and hd.hd_hash <= 759
;
