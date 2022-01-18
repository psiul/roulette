select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 164 and ss.ss_hash <= 914 and hd.hd_hash >= 638 and hd.hd_hash <= 971 and i.i_hash >= 73 and i.i_hash <= 473
;
