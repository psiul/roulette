select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 249 and ss.ss_hash <= 582 and hd.hd_hash >= 245 and hd.hd_hash <= 995 and d.d_hash >= 524 and d.d_hash <= 924
;
