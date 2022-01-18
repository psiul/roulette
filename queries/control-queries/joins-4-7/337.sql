select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 549 and ss.ss_hash <= 882 and d.d_hash >= 175 and d.d_hash <= 925 and hd.hd_hash >= 61 and hd.hd_hash <= 461
;
