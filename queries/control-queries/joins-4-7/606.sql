select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 191 and hd.hd_hash <= 524 and d.d_hash >= 134 and d.d_hash <= 884 and cd.cd_hash >= 353 and cd.cd_hash <= 753
;
