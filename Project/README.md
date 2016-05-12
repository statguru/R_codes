

#__Introduction__
In this 21st century traffic management has become a serious issue in our daily life. Almost every household has a four wheeler or a two- wheeler nowadays in our country. Due to this increase in the number of vehicles we are facing a lot of problems such as pollution, traffic jams and above all accidents which is posing a serious threat towards humanity. So, here is our sincere attempt to overcome this problem. We have just made an attempt to predict the number of cars that can possibly be on a road after a certain period of time, by means of regression. However this is just a basic level of the problem, but this problem can be further solved by considering many other factors taken into account.


Here, we consider a virtual road, and a particular probability that a car will pass through this road in a second. Next, we generate the cars for a particular time interval, considering each second by the method of simulation. Note that, the event that whether a car will pass in a second from that road or not is a Bernoulli trial with a certain probability of success. Now, if we add up all these events, then this will give us the number of cars that passes through that road in that given time interval. Also the number of cars for a particular time interval follows a binomial distribution with parameters n and p, where 'n' is the total time and 'p' is the probability that a car passes through that road in a second (as the sum of n independent Bernoulli trials follows a binomial distribution).


Now we know  that  for large values of n and small values of p Binomial distribution can be approximated by  Poisson distribution.  Poisson is a discrete frequency distribution which gives the probability of a number of independent events occurring uniformly  in a fixed time interval.  Here,  our  generated population values constitute a discrete dataset or a count dataset  and this can also be verified easily that  this process satisfies the conditions of a Poisson process , such as independence , stationarity  and orderliness. The random variable generated through this process is then a Poisson random variable. This phenomena  can be modeled by its predictive analog called count regression. There are several kinds of  count regressions, the simplest mode of count regression is Poisson regression. The simulated dataset is now analyzed  by Poisson regression. Here we use __R__ for the entire analysis and the analysis goes as follows ....






#__Theory__


###__Counting Process & Poisson Process__
A __counting process__ is a stochastic process  denoted by $[N(t),t\ge0]$ which satisfies the following conditions : --

1.	$N(t)\ge0$

2. 	$N(t)$ is an integer.

3.  If $s\le t$ ,then $N(s)\le N(t)$.

4. For $s<t$, $N(t)-N(s)$ equals the number of events that have occurred in the interval $(s,t]$

The counting process is a __poisson process__ having rate $\lambda$ , $\lambda>0$, if :

1. $N(0)=0$

2. The process has independent increments.

3. The number of events in any interval of length *t* follows a poisson distribution with mean $\lambda t$,

$P[N(t+s)-N(s)=n]=e^{-\lambda t}\frac{(\lambda t)^n}{n!}$       ,n=0,1,.....


### __Conditions of Poisson Process__

1. ___Stationarity___ : A counting process is said to possess stationarity if the number of events that occur in any interval depends only on the length of the time interval.

2. ___Independence___ : A counting process is said to possess independence if the number of events that occur in disjoint time intervals are independent.

3. ___Orderliness___ : This means that the occurrence of more than one event in a small time interval is not possible i.e, the occurrences of the event cannot occur simultaneously.

4. $P[N(h)=1]=$${\lambda h}+O(h)$ , for a time interval of length h.

Note that, the conditions (1),(2) and (3) implies condition (4). Hence if we verify the first three conditions the fourth condition gets verified.

### __Inter-arrival Time__

Consider a poisson process, and let X~1~ denote the time of the first event. Further for $n\ge1$, let X~n~ denote the time between (n-1)-th and n-th event. The sequence $[$ X~n~ , $n\ge1]$ is called the sequence of inter-arrival times. 

Note that, the inter-arrival times follow exponential distribution with parameter 1/$\lambda$

### __Poisson regression__

__Poisson regression__ is a form of regression analysis used to model count data.Poisson regression assumes the response variable Y has a Poisson distribution, and assumes the logarithm of its expected value can be modeled by a linear combination of unknown parameters. 

####__Variables__

In poisson regression the response variable Y is count.

__Explanatory variables__

1. Explanatory variables, X = (X~1~, X~2~,...X~k~), can be continuous or a combination of continuous and categorical variables. Convention is to call such a model Poisson Regression.

2. Explanatory variables, X = (X~1~, X~2~,... X~k~), can be all categorical. Then the counts to be modeled are the counts in a contingency table, and the convention is to call such a model log-linear model.

__Model__

$g(\mu)=\beta_0+\beta_1 x_1+...+\beta_k x_k$

__*Random Component*__ : Response Y has a Poisson distribution that is y~i~ ~ Poisson($\mu{~i~}$) for i=1,...,N where the expected count of y~i~ is $E(Y)=\mu$.

__*Systematic component*__ : Any set of X = (X~1~, X~2~,...X~k~) are explanatory variables. 

__Identity link__ : $g(\mu)=\beta_0+\beta_1 x_1$

Sometimes the identity link function is used in Poisson regression. This model is the same as that used in ordinary regression except that the random component is the Poisson distribution.

__Natural log link__ : $log(\mu)=\beta_0+\beta_1 x_1$

The Poisson regression model for counts is sometimes referred to as a Poisson loglinear model.

For simplicity, with a single explanatory variable, we write :

$log(\mu)=\alpha+\beta x$

This is eqivalent to $\mu = exp(\alpha+\beta x)=exp(\alpha)exp(\beta x)$.


__Interpretation of Parameter Estimates__

$exp(\alpha)=$ effect on the mean of Y, that is $\mu$, when X=0.

$exp(\beta)=$  with every unit increase in X, the predictor variable has multiplicative effect of $exp(\beta)$ on the mean of Y, that is $\mu$. 

* If $\beta=0$, then $exp(\beta)=1$, and the expected count, $\mu=E(y)=exp(\alpha)$ , and Y and X are not related.

* If $\beta>0$, then $exp(\beta)>1$, and the expected count, $\mu=E(y)$ is $exp(\beta)$ times larger than when X = 0.

* If $\beta<0$, then $exp(\beta)<1$, and the expected count, $\mu=E(y)$ is $exp(\beta)$ times smaller than when X = 0.

__Inference__

The usual tools from basic statistical inference are valid. Here we will test for the significance of the values of $\alpha$ and $\beta$.

__Model Fit__

There are many devices for testing the goodness of fit for the model such as Pearson's Chi-Square test, Deviance, Likelihood Ratio test. However, we will choose Pearson's Chi-Square test for testing the goodness of fit.


Recall that a Poisson random variable has the same mean and variance. Now, we'll introduce one more term called ___Overdispersion___.The term ___Overdispersion___ means that the observed variance is larger than the assumed variance, that is, here in our case the mean and the variance becomes unequal. So, this violates the Poisson law, and thus we need to find some methods which can remove this violation.

* ___Adjust for Overdispersion___ where we estimate $\phi = X^{2}/(N-p)$ and adjust the standard errors and test statistics.(where $\phi$ is the scale parameter, N is the no. of sample cases, and p is the no. of parameters)

* Use ___Negative Binomial Distribution___ instead, where the response variable is assumed to follow a negative binomial distribution.


#__Implementation in R__

First of all we need to enter the value of seet.seed, the no. of samples that you want to generate(or, the total time, in sec, for which we will count the cars ), and the probability that a car will arrive in each second.(As this is a virtual setup, we will not use Sys.sleep() function, because that will increase the time for computation. Had this been a real-world setup we would generate the sample using Sys.sleep() function, which would put the system into sleep for a given time)

Let us consider the value of set.seed as 123, and the no. of samples 'n' as 3000, and the probability that a car will arrive in each second be 0.2. We create a vector _car_ and run a loop 3000 times and generate a sample of size 1 each time from _bernoulli distribution_ with probability of success as 0.2, and together with the time we create a data frame named _data_ and display the first six and last six observations of _data_ as the size of the data is huge.

```{r}
set.seed(123)
car<-vector()
for(i in 1:3000)
{
 
 car[i]<-rbinom(1,1,0.2)
}
data<-data.frame(cbind(times<-seq(1,3000),car))
colnames(data)<-c("Time","Car")
head(data)
tail(data)

```

Next, we compute the inter-arrival times of the cars, by first assigning the variables _first_ and _k_ the values 0 and 1 and then assigning the value of _times[0]_ as 0, i.e, the first inter-arrival time is assumed to be 0, and then calculate the time difference between the arrival of two cars. By repeating this process 3000 times, we will get a vector of the inter-arrival times. The vector of _inter-arrival_ times is of a large dimension, so we display only the first six and last six obsevations of the vector.

```{r}
first<-0
k<-1
times[0]<-0
inter_arrival<-vector()
for(i in 1:3000)
{
  if(car[i]==1)
  {
    inter_arrival[k]<-times[i]-first
    k<-k+1
    first<-times[i]
  }
}
head(inter_arrival)
tail(inter_arrival)
```

Note that,

* The number of cars that arrives in a given interval of time depends on the length of the interval, as the probability that a car arrives in a second is given, so it is the interval on which the probability of the arrival of the car depends. Thus, the condition of ___stationarity___ is satisfied.

* Clearly, the occurrence of the arrival of cars in any time interval is completely independent of the other disjoint intervals. Hence the condition for ___independence___ has been achieved.

* Also, for a small time interval, let us consider a time interval of length 1 second, say, atmost one car can arrive, i.e, this indicates that for a small time interval the occurrence of more than two event is nearly impossible. Thus, the condition of ___orderliness___ is satisfied.

* Since the three conditions of a _poisson process_ has been achieved, so the fourth condition is also achieved, as the first three conditions implies the fourth condition.


Thus, the above counting process can be regarded as a ___poisson process___.


Now, we create a function to initiate the poisson process called _poissonProcess()_ that takes two parameters, one is the vector _x_ which contains inter-arrival times and the second one is the time within which we want to know how many of the events have occurred. The function returns the number of events that have occurred within a given time, i.e, the number of cars that have arrived within a given time _t_.

```{r}
poissonProcess<-function(x,t=1) {
  if(sum(x)<t)
    return(NA)
  if(x[1]>t)
    return(0)
  else
    return(max(which(cumsum(x)<=t)))
}

```
Now, we need to explain how the code works, and we proceed as, if the sum of all x values is less than t, then the function returns NA values. If the first inter-arrival time is greater than t then the function returns 0. Otherwise, the function returns max(which(cumsum(x)<=t)). This code needs some explanation, the expression cumsum(x) is a vector of the same length of x, where each element is the cumulative sum. The condition cumsum(x)$<$t creates a logical vector in which each value is _true_ or _false_ depending on the condition. All the _true_ values will be at the begining of the vector and the function _which()_ returns the indices for which the vector has a _true_ value and max returns the max of all such indices. Now let's see how the function works by using the inter_arrival vector that we have got previously and setting the values of t as 5, 10, 20.

```{r}
poissonProcess(inter_arrival,5)
```

Thus, 2 cars arrive within time 5 seconds.

```{r}
poissonProcess(inter_arrival,10)
```

Thus, 3 cars arrive within time 10 seconds.

```{r}
poissonProcess(inter_arrival,20)
```

Thus, 6 cars arrive within time 20 seconds.

Clearly, this is a cumulative process. Next, we generate a data using the above function. The data will be based on two variables, one is time (in secs) and the other one is cars. This will also be a cumulative data, i.e, the no. of cars arriving will be in a cumulative order. We initially create two vectors _cars_ for storing the number of cars that have arrived within a particular time, and, _time_ for storing the time. Intially we assume that the number of cars is 0. We then run a loop a finite number of times and then count the number of cars within a given time using the _poissonProcess()_ function. At last, we store the values of _time_ and _cars_ in a data frame. Since, the data is large, so here we display only the first six and last six observations of the data frame.  The code is as follows : 

```{r}
cars<-vector()
time<-vector()
k<-1
cars[0]<-0
for(i in seq(1,sum(inter_arrival),by=20))
{
  cars[k]<-poissonProcess(inter_arrival,i)
  time[k]<-i
  k<-k+1
}
reg_data<-data.frame(time,cars)
head(reg_data)
tail(reg_data)
```

Now, we can visualize the data generated by using the _plot()_ function.

```{r}
plot(time,
     cars,
     xlab="time",
     ylab="cars",
     main="Plot of the data generated", 
     col="red",
     pch=19)
```

As this data is a count data, so as we had stated before that we will use poisson regression for further analysis. The poisson regression can be implemented in R, using the _glm()_ function, and setting the family as _poisson_.

Here our model is,

$log(y)=\beta_0+\beta_1 x$,

where y is the cars and x is the time.
```{r}
model<-glm(cars~time,family="poisson",data=reg_data)
summary(model)
```

Now, we have to interpret the model that we have obtained. First of all, we would like to test whether the model coefficients are significant or not. For this, we would observe the p-values. The hypothesis are,

* H~01~ : $\beta_0 = 0$ vs H~11~ : $\beta_0 \neq 0$

Thus, if H~01~ is rejected then $\beta_0$ is significant, that is there is some effect of $\beta_0$ on the model. For testing, we use the p-value, if the p-value $< \alpha$ then we reject the null hypothesis at 100$\alpha %$ level of significance.


* H~02~ : $\beta_1 = 0$ vs H~12~ : $\beta_1 \neq 0$

Thus, if H~01~ is rejected then $\beta_1$ is significant, that is there is some effect of $\beta_1$ on the model. If $\beta_1=0$ ,then the model becomes $log(y)=\beta_0$ , which means the model completely fails in predicting Y .For testing, we use the p-value, if the p-value $< \alpha$ then we reject the null hypothesis at 100$\alpha %$ level of significance.

Also, it is clear that our model satisfies the assumptions of poisson model, since the events that have occurred are independent, i.e the arrival of a car for a particular time interval is independent. Hence the assumption of _independence_ has been achieved. Secondly, there is homogeneity in the data, because we are considering only one road over here. Thus, the assumption of _homogeneity_ has been achieved. Thirdly, the time period for which the observations are obtained is fixed.

The summary statistics tells us a number of things.The p-values are obtained from the extreme right column under __Coefficients__. We can observe one more thing that there are stars corresponding to each p-value. The more the number of stars the more significant is the model coefficient. Clearly, from the summary statistics we find that corrsponding to each p-value there are three stars. So, we reject the null hypotheses H~01~ and H~02~ at 5% level of significance and conclude that the the ___model coefficients are significant___.

Now, for prediction purpose we perform the following,

```{r}
predicted<-predict(model)
a_predicted<-sapply(predicted,exp)
```

We use _sapply_ for exponential transformation, since our model is $log(y)=\beta_0+\beta_1 x$ and the predicted values obtained are logarithmic and so we use an exponential transformation to obtain the actual predicted values.

We next plot the actuals and the predicted values (or, fitted values) to obtain the actuals versus fitted plot. Note that the fitted line is the red line in the graph and the actuals are plotted using black dots.

```{r}
plot(reg_data$cars,main="Actuals vs Fits",ylab="cars",type='l')
lines(a_predicted,col='red')
```

For testing the ___goodness of fit___, we use ___Pearson's chi-squared test___.

The hypothesis to be tested is,

H~0~ : The data follows a poisson distribution

versus

H~1~ :  The data donot follow a poisson distribution.

___Test Statistic___ : The data is divided into _k_ bins and the test statistic is, 

${\sum\limits_{i=1}^k (O_i-E_i)^{2}}/{E_i}$

where, $O_i$ is the observed frequency for bin _i_ and $E_i$ is the expected frequency for bin _i_. The expected frequency is calculated by,

$E_i=N(F(Y_u)-F(Y_l))$, where $Y_u$ is the upper limit for bin _i_ and $Y_l$ is the lower limit for bin _i_. 

The test statistics approximately follows a chi-square distribution with (k-c) degrees of freedom, where c is the no. of parameters to be estimated.

___Test Criteria___ : We reject the null hypothesis at 100$\alpha %$ level of significance if p-value $< \alpha$.

```{r}
chisq.test(a_predicted,reg_data$cars,correct=F)
```
Clearly, the p-value is 0.2523. So, p-value $> \alpha =0.05$. Hence we accept the null hypothesis at 5% level of significance and conclude that the data follows a poisson distribution. Thus, the given model has a fits good to the data that we have simulated.


# __Demonstration using Shiny App__


We will introduce in this section, the basic functions of Shiny Package and its uses and thus will give a brief overview of how to demonstrate the above problem using the Shiny App.


Shiny is nothing but a package in R that helps to build web applications straight from R. First of all we need to install _shiny_ package. Shiny apps have two components, one is a user-interface script and the other one is a server script. The user interface(ui) script controls the layout and appearance of the app, and is defined in a source script named as _ui.R_. The _server.R_ script contains the instructions that our computer needs to build the app. After completing the coding we can run the app using the _Run App_ command which is present in the top right hand corner of the editor. We will now discuss few functions that we have used in the shiny code : 

* The __ui.R__ has the following structure,

```{code}
library(shiny)
shinyUI(fluidPage(
      titlePanel(),
      sidebarLayout(
          sidebarPanel(),
          mainPanel()
      )
))
```

The _fluidPage()_ function tells R to create a page that would fit the user window. The _fluidPage()_ is then divided into two parts, one is _titlePanel()_ and the other is the _sidebarLayout()_ which is further subdivided into _sidebarPanel()_ and _mainPanel()_. The _titlePanel()_ is used to put the name of the title of the program or what is the topic for our program. The _sidebarLayout()_ divides the window into two parts, one is the _sidebarPanel()_ where the user gives input to the program by means of slider inputs, widgets, radio buttons, etc, and the _mainPanel()_ is the region where the ouput from the program is displayed. We will now discuss few functions that we have used in our ui.R :--

+ __sliderInput()__ :  This function constructs a slider widget to select a numeric value from a range. The parameters that are to be provided are the variable name in which the input will be stored, the label of the variable, the minimum value of the slider, the maximum value of the slider, and the initial value of the slider. There are more parameters associated with the function, but it is mandatory to give the value of the parameters discussed above.

+ __br()__ :  This is just a simple function used for constructing html documents.

+ __tabPanel()__ :  This function creates a tab panel that can be included within a _tabsetPanel_. The parameters that are to be given are the name or title of the tab, and the value that is to be displayed in the tab.

+ __tabsetPanel()__ :  This function creates a tabset that contains _tabPanel_ elements. Tabsets are useful for dividing output into multiple independently viewable sections.

+ __verbatimTextOutput()__  :  This function renders a reactive output variable as veratim text within an application page. The text will be included within an HTML pre tag.

+ __plotOutput()__ : This function displays a graph that is generated by the _server.R_.


So, here is our code for __ui.R__,

```{code}
library(shiny)
shinyUI(fluidPage(
  titlePanel(title=h1("Traffic Management System",align="center")),
  sidebarLayout(
    sidebarPanel(
      sliderInput("prob","1.Select the probability of a car in 1 sec",min=0.1,max=1,value=0.5,step=0.01),
      br(),
      sliderInput("n","2.Select the total time(in sec) for which you want to count the cars",min=1000,max=10000,value=5000),
      br(),
      sliderInput("seed","3.Select seed",min=100,max=1000,value=500)
    ),
    mainPanel(
      tabsetPanel(type="tab",
        tabPanel("Data",verbatimTextOutput("data")),
        tabPanel("Regression Model",verbatimTextOutput("regression")),
        tabPanel("Actuals vs Fits Graph",plotOutput("graph")),
        tabPanel("Goodness of Fit",verbatimTextOutput("test"))
      )
    )
  )
)
)
```


* The __server.R__ has the following structure,

```{code}
library(shiny)
shinyServer(
  function(input,output)
  {
  
  }
)
```


We will next define some of the functions that we have used in the __server.R__ file.
 
 
+ __reactive()__ :  This wraps a normal expression to create a reactive expression. The variable for which the _reactive()_ function is used, can be used globally anywhere inside the _shinyServer()_ function.

+ __renderPrint()__ :  This function makes  a reactive version of the given function that captures any printed output, and also captures its printable result, into a string. 

+ __renderPlot()__ :  This function renders a reactive plot that is suitable for assigning to an output slot.


So, here is our code for __server.R__, 
```{code}
poissonProcess<-function(x,t=1) {
  if(sum(x)<t)
    return(NA)
  if(x[1]>t)
    return(0)
  else
    return(max(which(cumsum(x)<=t)))
}
library(shiny)
shinyServer(
  
  function(input,output)
  {
    sze<-reactive({
      input$n
    })
    
    regn_data<-reactive({
    p<-as.numeric(input$prob)  
    seed<-input$seed
    data.df<-cbind(p,sze(),seed)
    set.seed(seed)
    car<-vector()
    for(i in 1:sze())
    {
      
      car[i]<-rbinom(1,1,p)
    }
    data<-data.frame(cbind(times<-seq(1,sze()),car))
    colnames(data)<-c("Time","Car")
    first<-0 #assuming the 1st inter-arrival time is 0
    k<-1 #k is the index of the inter_arrival vector
    times[0]<-0
    inter_arrival<-vector()
    for(i in 1:sze())
    {
      if(car[i]==1)
      {
        inter_arrival[k]<-times[i]-first
        k<-k+1
        first<-times[i]
      }
    }
    #Getting the data
    cars<-vector()
    time<-vector()
    k<-1
    for(i in seq(1,sum(inter_arrival),by=20))
    {
      cars[k]<-poissonProcess(inter_arrival,i)
      time[k]<-i
      k<-k+1
    }
    reg_data<-data.frame(time,cars)
    reg_data
    })
    output$data<-renderPrint({
      regn_data()
    })
    reg<-reactive({
      model<-glm(cars~time,family=poisson,data=regn_data())
    })
    output$regression<-renderPrint({
      print(summary(reg()))
      coeff<-coef(reg())
      print(paste0("cars=",round(coeff[1],5),"+",round(coeff[2],5),"*time"))
    })
    predicted<-reactive({
      predict(reg())
    })
    output$graph<-renderPlot({
      cars_pred<-sapply(predicted(),exp)
      plot(regn_data()$cars,main="Actuals vs Fits",ylab="cars",type="l")
      lines(cars_pred,col='red')
    })
    output$test<-renderPrint({
      
      print(chisq.test(regn_data()$cars,predicted(),correct=T))
    })
    }
)

```




# __Conclusion__

Although we have seen that the model coefficients are significant and the model fits well to the simulated data, we need to check one more property, i.e, _overdispersion_. For that, we need to check whether the mean and variance of the _cars_ variable. Then,

```{r}
mean(cars)
var(cars)
```

Thus, it is clear that the mean and variance are not equal, more precisely, the variance is greater than mean. Hence, this accounts for _overdispersion_. We have already discussed about the measures that can be taken when there is _overdispersion_ in the model. For that, we can use ___negative binomial regression___, which will reduce the _overdispersion_, and it can be implemented by using the MASS package, and the function _glm.nb()_.

```{r}
library(MASS)
model_new<-glm.nb(cars~time,data=reg_data)
summary(model_new)
```

Clearly, the model AIC for negative binomial is less than that of poisson regression. We already know that less the value of AIC of the model the better is the model.Thus, we conclude that our poisson regression model is valid in terms of validity but doest not fits well to the data. However, this fit can be improved by using negative binomial regression.


# __Bibliography__

We are extremely thankful to the Almighty for enriching us with our minds. We  would like to thank __Prof. Dr. Kapil Kumar__, Department of Statistics, University of Delhi for guiding us throughout this project.Also, there are a number of persons without whom it would had been impossible to complete this project. First of all, we would like to mention the name of our beloved friend _Aritra Biswas_, who have helped us whenever we needed his help. We would also express our gratitude to _Mr. Abhinav Agarwal_ whose videos in _youTube_ have taught us how to create a Shiny App. Also, we took references from the book _Stochastic Processes_ by _Sheldon Ross_, we also took references from the website <https://onlinecourses.science.psu.edu/stat504/node/165> and also _R help_ . This project not only taught us R, but also it helped us to get accustomed to Shiny Interface. The entire reporting of the project has been written in R markdown, which helped us to gain knowledge in markup languages. We have also developed our theoretical concepts on _Poisson Process_, _Poisson Regression_ and also _Simulation_, which will not only help us in our course work, but also help us in the near future.