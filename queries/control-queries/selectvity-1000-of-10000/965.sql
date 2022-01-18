select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 383 and ss.ss_hash <= 716 and i.i_hash >= 209 and i.i_hash <= 959 and hd.hd_hash >= 340 and hd.hd_hash <= 740
;
