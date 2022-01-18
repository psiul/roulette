select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 239 and ss.ss_hash <= 989 and i.i_hash >= 490 and i.i_hash <= 890 and cd.cd_hash >= 293 and cd.cd_hash <= 626
;
