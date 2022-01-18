select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 194 and ss.ss_hash <= 527 and i.i_hash >= 225 and i.i_hash <= 975 and hd.hd_hash >= 71 and hd.hd_hash <= 471
;
