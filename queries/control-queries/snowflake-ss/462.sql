select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 573 and ss.ss_hash <= 906 and hd.hd_hash >= 228 and hd.hd_hash <= 628 and d.d_hash >= 143 and d.d_hash <= 893
;
