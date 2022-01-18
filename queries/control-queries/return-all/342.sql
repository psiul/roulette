select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 308 and ss.ss_hash <= 641 and i.i_hash >= 529 and i.i_hash <= 929 and cd.cd_hash >= 83 and cd.cd_hash <= 833
;
